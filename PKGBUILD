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
source=(
$'build.sh'
$'README.md'
$'shlibdeps-resolve.pl'
)
sha256sums=(
$'06a0cb545a0e7228fd41f3f0bfcb46f6c252bd0b657491836d99804876923243'
$'8e6825eb5ba71cd15bc71c0c6fb321830115607bf8bcd50e133000539b226a54'
$'2194eaa22befe8b7d4211b2550f6da6db819e94d925e3a0ee16888aa8eb5d26c'
)
package () 
{ 
    depends=('perl' 'libdpkg-parse-perl' 'libdpkg-shlibdeps-resolve-perl');
    install -Dm755 "${srcdir}/shlibdeps-resolve.pl" "${pkgdir}/usr/bin/shlibdeps-resolve"
}
