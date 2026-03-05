#!/usr/bin/perl
######################################################################
# OpenID Connect Discovery
# GET /.well-known/openid-configuration
######################################################################
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use CGI;
use OAuth::Common;
use JSON qw(encode_json);

my $q = CGI->new;
my $c = OAuth::Common::load_config();

my $issuer = $c->{oauth_issuer};
my $base = $c->{oauth_base_path} || $issuer . '/WTE/oauth';

my $discovery = {
    issuer                     => $issuer,
    authorization_endpoint      => $base . '/oauth_authorize.pl',
    token_endpoint              => $base . '/oauth_token.pl',
    userinfo_endpoint           => $base . '/oauth_userinfo.pl',
    jwks_uri                   => $base . '/oauth_jwks.pl',
    scopes_supported            => [qw(openid email profile)],
    response_types_supported    => [qw(code)],
    grant_types_supported      => [qw(authorization_code)],
    subject_types_supported    => [qw(public)],
    id_token_signing_alg_values_supported => [qw(HS256 RS256)],
};

print $q->header(
    -type          => 'application/json; charset=utf-8',
    -Cache_Control => 'public, max-age=3600',
);
print encode_json($discovery);
