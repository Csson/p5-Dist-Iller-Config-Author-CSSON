# NAME

Dist::Iller::Config::Author::CSSON - Dist::Iller config for Csson

# VERSION

Version 0.0103, released 2016-01-19.

# SYNOPSIS

    # in iller.yaml
    +config: Author::CSSON
    splint: 1

# DESCRIPTION

Dist::Iller::Config::Author::Csson is a [Dist::Iller](https://metacpan.org/pod/Dist::Iller) configuration. The plugin list is in `share/author-csson.yaml`.

# Attributes

## filepath

<table cellpadding="0" cellspacing="0">
<tr>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;"><a href="https://metacpan.org/pod/Types::Path::Tiny#Path">Path</a></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">optional, default: <code>author-csson.yaml</code></td>
    <td style="padding-left: 6px; padding-right: 6px; white-space: nowrap;">read-only</td>
</tr>
</table>

<p>Path to the plugin configuration file, relative to the installed share dir location.</p>

## homepage

<table cellpadding="0" cellspacing="0">
<tr>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;"><a href="https://metacpan.org/pod/Types::Standard#Str">Str</a></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">optional, default: <code>https://metacpan.org/release/[distribution_name]</code></td>
    <td style="padding-left: 6px; padding-right: 6px; white-space: nowrap;">read/write</td>
</tr>
</table>

<p>URL to the distribution's homepage.</p>

## installer

<table cellpadding="0" cellspacing="0">
<tr>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;"><a href="https://metacpan.org/pod/Types::Standard#Str">Str</a></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">optional, default: <code>MakeMaker</code></td>
    <td style="padding-left: 6px; padding-right: 6px; white-space: nowrap;">read/write</td>
</tr>
</table>

<p>The installer plugin to be used.</p>

## is\_private

<table cellpadding="0" cellspacing="0">
<tr>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;"><a href="https://metacpan.org/pod/Types::Standard#Int">Int</a></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">optional, default: <code>0</code></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">read/write</td>
    <td style="text-align: right; padding-right: 6px; padding-left: 6px;"><code>1</code>:</td>
    <td style="padding-left: 12px;">Include [UploadToStratopan].</td>
</tr>
</table>

<p></p>

## is\_task

<table cellpadding="0" cellspacing="0">
<tr>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;"><a href="https://metacpan.org/pod/Types::Standard#Bool">Bool</a></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">optional, default: <code>0</code></td>
    <td style="padding-left: 6px; padding-right: 6px; white-space: nowrap;">read-only</td>
</tr>
</table>

<p>If set to a true value it will include [TaskWeaver] instead of [PodWeaver].</p>

## splint

<table cellpadding="0" cellspacing="0">
<tr>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;"><a href="https://metacpan.org/pod/Types::Standard#Int">Int</a></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">optional, default: <code>0</code></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">read/write</td>
    <td style="text-align: right; padding-right: 6px; padding-left: 6px;"><code>1</code>:</td>
    <td style="padding-left: 12px;">Include Pod::Elemental::Transformer::Splint in weaver.ini</td>
</tr>
</table>

<p></p>

## travis

<table cellpadding="0" cellspacing="0">
<tr>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;"><a href="https://metacpan.org/pod/Types::Standard#Int">Int</a></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">optional, default: <code>1</code></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">read/write</td>
    <td style="text-align: right; padding-right: 6px; padding-left: 6px;"><code>1</code>:</td>
    <td style="padding-left: 12px;">Include [TravisYML]. By default it tests 5.14+</td>
</tr>
</table>

<p></p>

## distribution\_name

<table cellpadding="0" cellspacing="0">
<tr>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;"><a href="https://metacpan.org/pod/Types::Standard#Str">Str</a></td>
    <td style="padding-right: 6px; padding-left: 6px; border-right: 1px solid #b8b8b8; white-space: nowrap;">optional</td>
    <td style="padding-left: 6px; padding-right: 6px; white-space: nowrap;">read-only</td>
</tr>
</table>

<p></p>

# ENVIRONMENT VARIABLES

## FAKE\_RELEASE

If set to a true value this will include \[FakeRelease\] and remove either \[UploadToCPAN\] or \[UploadToStratopan\].

# SOURCE

[https://github.com/Csson/p5-Dist-Iller-Config-Author-CSSON](https://github.com/Csson/p5-Dist-Iller-Config-Author-CSSON)

# HOMEPAGE

[http://metacpan.org/release/Dist-Iller-Config-Author-CSSON](http://metacpan.org/release/Dist-Iller-Config-Author-CSSON)

# AUTHOR

Erik Carlsson <info@code301.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by Erik Carlsson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
