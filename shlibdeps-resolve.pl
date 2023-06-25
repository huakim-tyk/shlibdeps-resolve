#!/usr/bin/perl
use Getopt::Long GetOptionsFromArray;
use Module::Load;

my $bin = [];
my $root = [];
my $version;
my $VERSION = "0.1";

GetOptionsFromArray(\@ARGV,  
"binary|b=s" => $bin,
"version|v" => \$version,
"help|h" => \$help,
"root|r=s" => $root);


if (! scalar @$bin)  { $bin  = undef; }
if (! scalar @$root) { $root = undef; }

if ($help){
    help:
    print "Usage: shlibdeps-resolve [<option>...] -b src
    
Options:
    --binary|-b   src - add binary file or directory for scanning 
    --root|-r     src - add directory where libraries are located
    --help|-h         - show help
    --version|-v      - show version
";
} else {
    if ($version) {
        print($VERSION); 
    } else {
        if (defined $bin){
            load 'DPKG::ShlibDeps::Resolve', qw(scan_shared_lib);
            print(join("\n", scan_shared_lib(
                'base', $bin, 
                'root', $root
            )));
        } else {
            goto help;
        }
    }
}
