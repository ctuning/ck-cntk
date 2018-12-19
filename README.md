# Collective Knowledge repository for CNTK

[![compatibility](https://github.com/ctuning/ck-guide-images/blob/master/ck-compatible.svg)](https://github.com/ctuning/ck)
[![automation](https://github.com/ctuning/ck-guide-images/blob/master/ck-artifact-automated-and-reusable.svg)](http://cTuning.org/ae)
[![workflow](https://github.com/ctuning/ck-guide-images/blob/master/ck-workflow.svg)](http://cKnowledge.org)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

## Introduction

This repository provides high-level, portable and customizable workflows
for [CNTK](https://www.microsoft.com/en-us/cognitive-toolkit/).
It is a part of our long-term community initiative
to unify and automate AI, ML and systems R&D
using [Collective Knowledge Framework (CK)](http://cKnowledge.org),
and to collaboratively co-design efficient SW/HW stack for AI/ML
during open [ACM ReQuEST competitions](http://cKnowledge.org/request)
as described in the [ACM ReQuEST report](https://portalparts.acm.org/3230000/3229762/fm/frontmatter.pdf).
All benchmarking and optimization results are available 
in the [public CK repository](http://cKnowledge.org/repo).
See [CK getting started guide](https://github.com/ctuning/ck/wiki/First-Steps)
for more details about CK.

## Coordination of development

* [cTuning Foundation](http://cTuning.org)
* [dividiti](http://dividiti.com)

## Minimal CK installation

The minimal installation requires:

* Python 2.7 or 3.3+ (limitation is mainly due to unitests)
* Git command line client.

### Linux/MacOS

You can install CK in your local user space as follows:

```
$ git clone http://github.com/ctuning/ck
$ export PATH=$PWD/ck/bin:$PATH
$ export PYTHONPATH=$PWD/ck:$PYTHONPATH
```

You can also install CK via PIP with sudo to avoid setting up environment variables yourself:

```
$ sudo pip install ck
```

### Windows

First you need to download and install a few dependencies from the following sites:

* Git: https://git-for-windows.github.io
* Minimal Python: https://www.python.org/downloads/windows

You can then install CK as follows:
```
 $ pip install ck
```

or


```
 $ git clone https://github.com/ctuning/ck.git ck-master
 $ set PATH={CURRENT PATH}\ck-master\bin;%PATH%
 $ set PYTHONPATH={CURRENT PATH}\ck-master;%PYTHONPATH%
```

## CNTK CK workflow installation (Linux or Windows)

### Prerequisites

Linux:

* If problem with ligpng: 
```
wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb   && sudo dpkg -i /tmp/libpng12.deb   && rm /tmp/libpng12.deb
```

### CPU

```
$ ck pull repo:ck-cntk
$ ck install package --tags=lib,cntk,vcpu
```

### GPU including 1bit SGD

```
$ ck pull repo:ck-cntk
$ ck install package --tags=lib,cntk,vgpu
```

## Checking classification example (and automatically installing available MXNet model(s) via CK)

```
$ ck run program:cntk
```

* Select 'demo-feed-forward-net' command line
* Observe result

## Trying CK CNTK in Docker

Build Docket image:
```
$ ck build docker:ck-cntk-py35 --sudo
```

You can now run this Docker image:
```
$ ck run docker:ck-cntk-py35 --sudo
$ ck run program:cntk
```

Skip --sudo if you have local Docker installation.

## Related Publications with long term CK vision

```
@inproceedings{ck-date16,
    title = {{Collective Knowledge}: towards {R\&D} sustainability},
    author = {Fursin, Grigori and Lokhmotov, Anton and Plowman, Ed},
    booktitle = {Proceedings of the Conference on Design, Automation and Test in Europe (DATE'16)},
    year = {2016},
    month = {March},
    url = {https://www.researchgate.net/publication/304010295_Collective_Knowledge_Towards_RD_Sustainability}
}

@inproceedings{cm:29db2248aba45e59:0c7348dfbadd5b95,

   author = {{Moreau}, Thierry and {Lokhmotov}, Anton and {Fursin}, Grigori},
    title = "{Introducing ReQuEST: an Open Platform for Reproducible and Quality-Efficient Systems-ML Tournaments}",
  journal = {ArXiv e-prints},
archivePrefix = "arXiv",
   eprint = {1801.06378},
 primaryClass = "stat.ML",
 keywords = {Statistics - Machine Learning, Computer Science - Learning, Computer Science - Software Engineering},
     year = 2018,
    month = jan,
   adsurl = {http://adsabs.harvard.edu/abs/2018arXiv180106378M},
  adsnote = {Provided by the SAO/NASA Astrophysics Data System}
}

```

## Feedback

* [CK community](https://github.com/ctuning/ck/wiki/Contacts).
