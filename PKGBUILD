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
$'06a0cb545a0e7228fd41f3f0bfcb46f6c252bd0b657491836d99804876923243'
$'b450ce7d8564aa47801eb90b18c013e7223306974272569e012d86a16c2938f3'
)
package () 
{ 
    depends=('perl' 'libdpkg-parse-perl' 'libdpkg-shlibdeps-resolve-perl');
    install -Dm755 "${srcdir}/shlibdeps-resolve.pl" "${pkgdir}/usr/bin/shlibdeps-resolve"
}
