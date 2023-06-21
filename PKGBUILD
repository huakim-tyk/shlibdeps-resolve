pkgbase=$'shlibdeps-resolve'
pkgname=$'shlibdeps-resolve'
pkgver=$'0.1'
pkgrel=$'1'
pkgdesc=$'An\ shared\ library\ dependencies\ resolver'
arch=(
$'all'
)
url=$'https://github.com/huakim-tyk/shlibdeps-resolve/'
license=(
$'GPL2'
)
package () 
{ 
    depends=('perl' 'libdpkg-parse' 'libdpkg-shlibdeps-resolve');
    install -Dm755 "${srcdir}/shlibdeps-resolve.pl" "${pkgdir}/usr/bin/shlibdeps-resolve"
}
