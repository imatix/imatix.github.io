#! /usr/bin/perl
process_htx ($ARGV [0]);

sub process_htx {
    my ($filename, $args) = @_;
    open my $input, "$filename.htx";
    while (<$input>) {
        if (/<%% (\w+) (.*)%%>/) {
            process_htx ($1, $2);
        }
        elsif (/<%% \$1 %%>/) {
            print $`.$args.$';
        }
        else {
            print $_;
        }
    }
}
