use v6.d;
use lib "%*ENV<HOME>/src/Raku/Terminal-Print/lib";
use lib "%*ENV<HOME>/src/Raku/raku-Terminal-Window/lib";
use Vikna::App;
use Vikna::TextScroll;

my ($st, $et);
my $count = 100;

class ScrollApp is Vikna::App {
    method main {
        note "VIKNA-APP: ", $*VIKNA-APP.WHICH;
        my $ts = $.desktop.create-child: Vikna::TextScroll, :w(80), :h(30), :x(20), :y(3), :auto-clear;
        $.desktop.invalidate;
        $.desktop.redraw;
        await $.desktop.sync-events;
        $.screen.print: 0,0, $.desktop.canvas;
        $st = now;
        for ^$count {
            my $c = 10.rand.Int;
            my $s = $c x $c;
            $ts.say: "Line [{.fmt: '%4d'}] of {$ts.buffer.elems.fmt: '%4d'} $s";
            # sleep .01;
        }
        $et = now;
        # sleep 1;
        $ts.print: "Line A\c[FORM FEED]Line B";
        # sleep 1;
        $ts.print: "\rLB";
        # sleep 1;
    }
}

my $app = ScrollApp.new;
$app.run;

$app.debug: "Bench result: ", ($et - $st), " seconds, ", $count / ($et - $st), " lines/sec";
