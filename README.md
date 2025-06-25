# jyotirmoymanifest <img src="https://img.shields.io/badge/RStudio-Addin-blue" align="right" />

> 🧘 Insert Manifestation and Author Headers in R Scripts with Purpose and Clarity

[![License: GPL-3](https://img.shields.io/badge/License-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![R](https://img.shields.io/badge/R-%3E=3.5.0-blue.svg)](https://cran.r-project.org/)
[![GitHub](https://img.shields.io/github/last-commit/YOUR_USERNAME/jyotirmoymanifest)](https://github.com/YOUR_USERNAME/jyotirmoymanifest)

---

## ✨ Features

- Inserts a manifestation/intention block at the top of R scripts
- Adds structured author metadata: name, email, date, citation, etc.
- Works as a one-click RStudio Addin
- Interactive prompts or pre-filled user defaults
- User settings saved in `~/.manifest_profile.R`

---

## 🚀 Installation

### From GitHub

```r
# install.packages("remotes")
remotes::install_github("JD2112/jyotirmoymanifest")
```

## 🧘 Usage

Once installed:

- Open a new or existing R script
- Go to `Addins` → `Insert Manifestation Header`
- Fill out the prompts, or use your saved defaults

Or run directly in console:

`jyotirmoymanifest::insert_manifestation()`

## 🗂️ User Profile Configuration

You can create `~/.manifest_profile.R` to auto-fill fields:

```r
manifest_profile <- list(
  author = "Jyotirmoy Das, Ph.D.",
  email = "jyotirmoy.das@liu.se",
  citation = "@article{...}",
  copyright = "GNU3 open license"
)
```

## 📜 License

This package is licensed under the GPL-3 License.

## 🙏 Acknowledgements

Created by [Jyotirmoy Das](https://github.com/JD2112).

For use in reproducible research, and academic scripting workflows.

