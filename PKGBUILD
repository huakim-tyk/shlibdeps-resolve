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
$'shlibdeps-resolve.pl'
)
sha256sums=(
$'e0cda23e99b2d6b32a23caa729a32ea867dd7bbf4c81bfc6acdfee4222212364'
$'b450ce7d8564aa47801eb90b18c013e7223306974272569e012d86a16c2938f3'
)
package () 
{ 
    depends=('perl' 'libdpkg-parse' 'libdpkg-shlibdeps-resolve');
    install -Dm755 "${srcdir}/shlibdeps-resolve.pl" "${pkgdir}/usr/bin/shlibdeps-resolve"
}
