#!/usr/bin/env perl
use DPKG::Parse::Packages;
use Data::Dumper;
use File::Basename;
use File::Copy::Recursive qw(pathmk);
use Algorithm::Loops qw(NestedLoops);
use File::Path qw(rmtree);
use Set::Scalar;

my $pkgs;
my $set=Set::Scalar->new;
my $dirset=Set::Scalar->new;

my $dists=['dists'];
my $releases=['fijik19'];
my $parts=['main'];
my $archs=['binary-all','binary-amd64','binary-i386'];

my $iter = NestedLoops([ $dists, $releases, $parts, $archs ]);

while ( my @loop = $iter->() ) {
    my $path = join('/', @loop, 'Packages');
    if ( -f $path ){
        $pkgs=DPKG::Parse::Packages->new;
        $pkgs->filename($path);
        $pkgs->parse;
        for my $entry (@{$pkgs->entryarray}){
            my $filename = $entry->{filename};
            $dirset->insert(dirname($filename));
            $set->insert($filename);
        }
    }
}

rmtree('repo/debian');

for my $e ($dirset->elements) { 
    pathmk('repo/debian/'.$e);
}


for my $e ($set->elements) { 
    link($e, 'repo/debian/'.$e);
}

symlink('../../dists', 'repo/debian/dists');
