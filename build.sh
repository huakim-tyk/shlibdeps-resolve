#!/bin/bash
vartype() {
    local var=$( declare -p ${1} || echo '' )

    if [ -z "${var}" ]; then
        echo "UNDEF"
    else 
        local reg='^declare -n [^=]+=\"([^\"]+)\"\$'
        while [[ $var =~ $reg ]]; do
            var=$( declare -p ${BASH_REMATCH[1]} )
        done
        
        case "${var#declare -}" in
        a*)
            echo "ARRAY";;
        A*)
            echo "HASH";;
        i*)
            echo "INT";;
        *)
            echo "OTHER";;
        esac
    fi
}

getvar(){
    local varname="$1"
    declare -n value="${varname}"
    local vartype="$(vartype ${varname})"
    
    local str=''

    case ${vartype} in 
    
    ARRAY)
        printf '(\n'
        for i in "${value[@]}" 
        do
            printf "$'%q'\n" "${i}"
        done
        printf ')'
    ;;
    
    HASH)
        printf '(\n'
        for i in "${!value[@]}" 
        do
            printf "[$'%q']=" "${i}"
            printf "$'%q'\n" "${value[${i}]}"
        done
        printf ')'
    ;;
    
    INT)
        printf "${value}"
    ;;
    
    OTHER)
        printf "$'%q'" "${value}"
    ;;
    
    UNDEF)
        printf
    ;;
    
    esac
}

list=()
funlist=(build package)
add(){
    
    list+=("$1")
    eval "$1=$2"
}


add pkgbase '"shlibdeps-resolve"'
add pkgname '"${pkgbase}"'
add pkgver "$(perl ./shlibdeps-resolve.pl -v)"
add pkgrel '1'
add pkgdesc "'An shared library dependencies resolver'"
add arch "('all')"
add url "https://github.com/huakim-tyk/shlibdeps-resolve/"
add license "('GPL2')"
add source '()'
add sha256sums '()'

#shopt -s globstar

package(){
    depends=('perl' 'libdpkg-parse' 'libdpkg-shlibdeps-resolve')
    install -Dm755 "${srcdir}/shlibdeps-resolve.pl" \
        "${pkgdir}/usr/bin/shlibdeps-resolve"
}

for i in *; do 
    if [ -f $i ] && 
    [ ${i} != 'PKGBUILD' ] && 
    [ ${i: -4} != '.deb' ]; then 
        line=($(sha256sum $i));
        sha256sums+=("${line[0]}") 
        source+=("${line[1]}") 
    fi
done

rm PKGBUILD 2>/dev/null
(
for i in "${list[@]}"; do
   echo -n "${i}="
   getvar "${i}"
   echo
done
for i in "${funlist[@]}"; do
   declare -f "${i}"
done
) > PKGBUILD

if [ "$1" == "commit" ]; then
    makedeb --gitcommit
fi

