
<!-- README.md is generated from README.Rmd. Please edit that file -->

# actdata

<!-- badges: start -->

<!-- badges: end -->

This package is intended to be a repository for standarized versions of
all publicly released affect control theory dictionaries and equations.
These datasets are currently stored in several different places and in
several different formats. Standardizing them and providing them
together in one R package is intended to make them easier to access and
make part of a reproducible analysis workflow.

Details on standarization procedures for dictionaries and equation sets
as well as instructions for how to access the data in this package are
provided below.

## Installation

You can install the development version of actdata from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ahcombs/actdata")
```

## Dictionaries

This package makes available 25 affect control theory dictionaries that
have been publicly released. These dictionaries span nearly 45 years and
have been collected in many locations around the world.

To see details–including descriptions and citation information–for the
dictionaries available, call `dict_info()`. Include a dictionary key as
an argument to see information for just that dictionary:

``` r
library(actdata)
dict_info("nc1978")
```

### Naming convention

Dictionary datasets are named according to the following format:

\[key\]*\[component\]*\[gender\]\_\[datatype\]\_dict

  - *Key* is an identifier unique to a particular study (e.g. `nc1978`;
    `morocco2015`). Call `dict_info()` to see the keys for the provided
    datasets.
  - *Component* indicates what kind of terms are included in the
    dictionary dataset. Typically, studies provide dictionary datasets
    with more than one component, but not all studies provide all
    possible components. Components include:
      - *identities*: Words that describe actors. Typically nouns
        (e.g. academic, woman, youngster)
      - *behaviors*: Actions that actors can perform. Typically verbs
        (e.g. wheedle, acclaim, work)
      - *mods*: Modifiers. Typically adjectives that can be applied to
        identities (e.g. active, witty, young)
      - *settings*: Places and situations (e.g. airplane, alley,
        worship\_service)
  - *Gender* indicates the gender of the participants who rated the
    terms. Options are `m`, `f`, and `av`. Av (average) indicates that
    participants of all genders were included, though the way this is
    calculated differs slightly by dictionary. Some dictionaries
    (e.g. the 2015 US, Morocco, and Egypt dictionaries) are originally
    published as average values over raters of all genders. In these
    cases, `av` is the only provided option. Other dictionaries are
    originally published in male and female subsets. Average values over
    all raters are not provided in these originally published sets. In
    this case, the package calculates an approximate average by
    averaging the male and female values. Typically, studies recruit
    approximately equal numbers of men and women and men and women’s
    ratings do not differ substantially on most terms, so we expect
    these approximate average values to be reasonably close to those
    that we would obtain from an average over all raters. For these
    dictionaries that provide male and female subsets separately, the
    package provides male, female, and approximate average versions. For
    more information on gender and affect control theory dictionaries,
    see section 4.1 of David Heise’s *Expressive Order* (2007).
  - *Datatype* is used when the desired dictionary provides variance
    information in addition to mean values. Most research in the affect
    control theory tradition to date has only utilized mean evaluation,
    potency, and activity values, and most dictionaries provide only
    means. However, BayesACT, a recent expansion of affect control
    theory, makes it possible to use variance information around these
    means (see Schröder, Hoey, and Rogers’s 2016 American Sociological
    Review publication for description of BayesACT). This package
    currently includes one dictionary (uga2015bayesactsubset) with
    standard deviation and covariance matrix data. The datasets
    corresponding to this dictionary include `SD` or `COV` in the
    `datatype` slot, depending on whether they include standard
    deviation or covariance matrix values. For all other dictionaries,
    which include means only, leave this slot empty.

Load data sets using `data()` with the desired data set name as the
argument. See information on the structure and size of each data set
using `?`.

### Term standardization

To facilitate comparisons between dictionaries, the terms in all have
been transformed into a common format. All terms are provided in
all-lowercase and spelling and spacing have been made standard across
dictionaries (generally, the US spellings are chosen). Spaces are
represented by underscores in all dictionaries. Accents have been
removed. The code used to perform this standardization is located in
`standardize_dict_terms.R`, included in this package.

### Term tables

One of the main goals of this package is to make it easy to compare
across dictionaries. To this end, the package provides four *term
tables* that show at a glance which terms are included in which
dictionaries. There is one table for each component (identities,
behaviors, modifiers, settings). Load these tables into your environment
using:

    * `data("term_table_ident")`
    * `data("term_table_beh")`
    * `data("term_table_mod")`
    * `data("term_table_set")`

Each column in these tables represents a dictionary (labeled with its
key) and each row is a term. Cell entries (0/1) indicate whether or not
the specified dictionary has the specified term. These tables can easily
be modified further to generate summaries across a set of dictionaries
of interest.

## Equations

The second kind of data this package makes available are tables
containing estimates of affect control theory equation coefficients.
These coefficients can be used in conjunction with dictionaries to
calculate affective responses to various situations. See section 18.2 of
David Heise’s *Expressive Order* (2007) for a detailed description of
the structure and use of these tables.

To see information on all equation sets available in this package, call
`eqn_info()`. All of the available equation sets were originally sourced
from Interact (version 2.1 beta, accessed May 2021), and component
titles are based on labels applied in Interact.

### Naming convention

The equation datasets are named according to the following convention:

\[key\]*\[component\]*\[gender\]\_eqn

  - *Key* is a unique identifier for the study in which the equation
    coefficients were estimated. Some of these overlap with dictionary
    keys, but not all. All keys can be accessed using `eqn_info()`.
  - *Component* indicates the type of equations represented. The
    following components are possible (more information on each is
    available in section 18.2 of David Heise’s *Expressive Order*
    (2007)):
      - *impressionabo*: Impression change equations including actor,
        behavior, and object terms
      - *impressionabos*: Impression change equations including actor,
        behavior, object, and setting terms
      - *selfdir*: Equations for self-directed action, including actor
        and behavior terms.
      - *traitid*: Equations for combining a trait modifier with an
        identity. In some datasets, this set is the same as the
        emotionid set.
      - *emotionid*: Equations for combining an emotion modifier with an
        identity. In some datasets, this set is the same as the traitid
        set.
  - *Gender* indicates the gender of study participants whose ratings
    are used to estimate the equation coefficients. Options are `m`,
    `f`, and `av`. Call `dict_info()` to check which genders are
    available for which dictionaries. Interact, from which all of these
    equation sets were originally taken, provides male and
    female-labeled sets for each equation. However, sometimes these sets
    are identical. In this case, this package simply labels the set as
    `av` rather than including it twice. All values are provided exactly
    as they are in Interact–no post-hoc calculations have been
    performed.

## Writing files for Interact

Interact allows users to import their own dictionary and equation files.
Though many of the dictionaries and equation sets provided here are
available in Interact, several are not. Additionally, sometimes it is
useful to use subsets of dictionaries (e.g. when a user wants to
restrict the identities, behaviors, or modifiers available), and
creating these subsets within Interact itself, while possible, is
tedious and not easily replicable.

The `save_for_interact(data, type, filename)` function in this package
makes it easy to write dictionary and equation .txt files that are
correctly formatted for copying and pasting into Interact. The `data`
argument should be a dataframe that the user wishes to save (it can be
one of those provided, or one created by the user). `type` should be
either `dict` or `eqn` (by default, it is set to `dict`). `filename`
should be the filepath at which the user wishes to save the file (by
default, it saves to the working directory under the name of the
dataset). All filepaths must end in .txt.

## Working within and across dictionaries: an example using the Tidyverse

To see an example of working with the dictionaries included in this
package, see the included [vignette](tidyversesubsetexample.html).
