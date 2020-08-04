NAME
====

`Vikna` – all native event-driven Raku console UI

SYNOPSIS
========



    use Vikna::App;
    use Vikna::Window;
    use Vikna::Button;
    use Vikna::Events;

    class MyWin is Vikna::Window {
        multi method event(Event::Mouse::Click:D $ev) {
            $.desktop.quit;
        }
    }

    class MyApp is Vikna::App {
        method main {
            my $w = $.desktop.create-child: Vikna::Window,
                                            :x(5), :y(5), :w(20), :h(10),
                                            :name('MainWin'), :title('Main Window');
            $w.create-child: Vikna::Button, :x(1), :y(1), :text("Quit"), :target($w);
        }
    }

    MyApp.run;

DESCRIPTION
===========



This framework is an attempt to provide a full-fledged console UI for [Raku](https://raku.org). It aims at few primary targets:

  * Be a multi-platform. This is achieved by:

    * being a pure Raku, i.e. avoid use of any native libraries

    * being OS-independent by incapsulating any OS-specific logic in a driver-like layer

  * Support fully asynchronous model of development

Any other implementation specifics of the framework are decisions taken to meet the above targets.

More information can be found in the following sections:

  * [`Vikna::Manual`](https://github.com/vrurg/raku-Vikna/blob/v0.0.3/docs/md/Vikna/Manual.md)

  * [`Vikna::Classes`](https://github.com/vrurg/raku-Vikna/blob/v0.0.3/docs/md/Vikna/Classes.md)

DISCLAIMER
==========



The project is currently in the early development stage serving more as a proof of concept than anything else. For anyone willing to try it it means bugs and slowness in many use cases. Also, apparently the API is far from being stable and can change any time, perhaps even without a prior warning. Things are gonna be this way up until v0.1.0 release I expect the API to stabilize up to the level to be promised that nothing gets changed without a few weeks deprecation period. v0.2.0 should bring in even more strict policies, yet this future is too far now to be discussed.

AUTHOR
======



Vadim Belman <vrurg@cpan.org>

