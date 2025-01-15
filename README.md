
<!-- README.md is generated from README.Rmd. Please edit that file -->

# actdata

<!-- badges: start -->
[![DOI](https://zenodo.org/badge/378248080.svg)](https://doi.org/10.5281/zenodo.14652399)
<!-- badges: end -->

This package is a repository for standardized versions of publicly
released affect control theory dictionaries and equations, which span
nearly 45 years and many cultures worldwide. These data sets can be used
by affect control theorists to understand the cultural meaning of
objects and events, as well as how these meanings vary across time and
place.

The ACT research community has a long and commendable history of making
their tools and data publicly available. This package provides that data
in a standardized format alongside functions that help users search,
subset, and export it in a format that works for their analysis program
of choice. It makes it unnecessary for researchers to store their own
local copies of publicly available data, and greatly simplifies the
process of comparing values across cultures or time periods.

For information on get started with actdata, see the [Getting
Started](https://ahcombs.github.io/actdata/articles/actdata.html) page.

## Affect control theory

Affect control theory is a social psychological theory of cultural
meaning and interaction. In it, words have quantatively-defined meanings
on three dimensions of sentiment: evaluation (good vs bad), potency
(powerful vs weak), and activity (active vs passive). Affect control
theory dictionaries contain these evaluation, potency, and activity
(EPA) values for a variety of identities, behaviors, modifiers, and
settings. Equations describe how different terms work together to create
meaning in the context of events. For more information about affect
control theory, see
[affectcontroltheory.org](http://affectcontroltheory.org/the-theory/overview/)
and the many academic resources that it links to.

## Why actdata?

Many affect control theory data sets have been publicly released by the
researchers who collected them. However, these data sets are stored in
several different places and in several different formats. The actdata R
package standardizes them and brings them together in one place in order
to make them easier to access and make part of a reproducible analysis
workflow. Details on standardization procedures for dictionaries and
equation sets are located on the [standardization details
page](https://ahcombs.github.io/actdata/articles/standardization.html).

## This is a work in progress!

This package is still in a beta state. Development is ongoing, and I
can’t promise that there won’t be breaking changes in future versions. I
ask that you bear with me as I work towards the goal of developing a
tool that is as flexible, useful, and user-friendly as possible!

Please get in touch with [me](https://aidancombs.netlify.app/)
(ahc26atduke.edu) if I have missed any data sets, if you encounter any
bugs or confusions, or if you have thoughts about how this might be made
a more useful tool. All feedback is helpful and appreciated!

## You may also be interested in…

This package was developed in conjunction with two other open-source R
packages that may also be of interest to the ACT research community.
Together, the goal of these packages is to make ACT research more
accessible, and to make it possible to use R to do analysis in a
self-contained and completely reproducible and transparent way.

Both packages provide functions that allow users to take these data and
run interaction simulations with it.

-   [**inteRact**](https://ekmaloney.github.io/inteRact/): inteRact,
    developed and maintained by [Em
    Maloney](https://sociology.duke.edu/em-maloney), is a package that
    allows users to run affect control theory simulations in R. It was
    built to be an open source, R-based version of its namesake Java
    program, INTERACT, which has been used by researchers to run affect
    control theory simulations since the 1990s. inteRact uses an R-based
    interface, rather than a graphic user interface, making re-running
    simulations much simpler and less time-consuming. It also provides
    support for running batches of simulations at one time.

-   [**bayesactR**](https://ahcombs.github.io/bayesactR/): bayesactR,
    which [I](https://aidancombs.netlify.app/) develop and maintain, is
    an R package that serves as an R wrapper for the BayesACT tool,
    developed by Jesse Hoey and colleagues. BayesACT is a Bayesian
    extension of affect control theory that treats meanings as
    distributions, rather than points, and simulations as probabilistic
    rather than determinative. See the [package
    website](https://ahcombs.github.io/bayesactR/) for more information.
