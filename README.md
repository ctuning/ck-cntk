# Collective Knowledge repository for CNTK

[![logo](https://github.com/ctuning/ck-guide-images/blob/master/logo-powered-by-ck.png)](https://github.com/ctuning/ck)
[![logo](https://github.com/ctuning/ck-guide-images/blob/master/logo-validated-by-the-community-simple.png)](http://cTuning.org)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)

## Introduction

This repository provides high-level, portable and customizable workflows
for [CNTK](https://github.com/Microsoft/CNTK) 
as a part of our long-term community initiative
to [unify and automate AI](http://cKnowledge.org/ai) 
using [Collective Knowledge Framework (CK)](http://github.com/ctuning/ck/wiki).

CK enables sharing of various AI engines and artifacts 
as [reusable, customizable and portable components with a simple JSON API and meta information](http://cKnowledge.org/ai-artfacts)
CK also helps researchers quickly prototype 
[portable AI workflows](https://github.com/ctuning/ck/wiki/Portable-workflows)
by assembling together CK components similar to LEGO(tm), 
plugging in various versions of AI frameworks together with 
different libraries, compilers, tools, models and data sets,
and automating and customizing their installation across 
Linux, Windows, MacOS and Android
(see shared [CK repositories](https://github.com/ctuning/ck/wiki/Shared-repos),
[modules](https://github.com/ctuning/ck/wiki/Shared-modules),
[packages](https://github.com/ctuning/ck/wiki/Shared-packages) 
and [software detection plugins](https://github.com/ctuning/ck/wiki/Shared-soft-descriptions)).

Such portable workflows can now be crowdsourced 
across diverse platforms from IoT to supercomputers provided by volunteers 
to enable practical and collaborative benchmarking, optimization and co-design of 
the whole AI stack (SW/HW/models) in terms of accuracy, execution time, power consumption, 
resource usage and other costs (see [public open CK repository](http://cKnowledge.org/repo), 
vision papers [1](https://arxiv.org/abs/1506.06256), [2](http://doi.acm.org/10.1145/2909437.2909449)
and [reproducible and CK-powered AI/SW/HW co-design competitions at ACM/IEEE conferences](http://cKnowledge.org/request)).

## Coordination of development

* [cTuning Foundation](http://cTuning.org)
* [dividiti](http://dividiti.com)

## Installation (Linux or Windows)

### Prerequisites

* Python 2.7+ or 3.4+ with pip
* Python sub-packages will be installed by CK

Linux:

* If problem with ligpng: 
```
wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb   && sudo dpkg -i /tmp/libpng12.deb   && rm /tmp/libpng12.deb
```

### CPU

```
$ (sudo) pip install ck
$ ck pull repo:ck-cntk
$ ck install package --tags=lib,cntk,vcpu
```

### GPU including 1bit SGD

```
$ (sudo) pip install ck
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

## Next steps

We plan to add unified compilation of CNTK via CK 
with various libs on Linux, Windows, MacOS and Android
similar to [ck-caffe](https://github.com/dividiti/ck-caffe), 
[ck-caffe2](https://github.com/ctuning/ck-caffe2),
[ck-tensorflow](https://github.com/ctuning/ck-tensorflow),
[ck-mvnc](https://github.com/ctuning/ck-mvnc] 
and [ck-mxnet](https://github.com/ctuning/ck-mxnet).

We now have a proof-of-concept to unify AI engines and artifacts to perform collaborative AI/SW/HW benchmarking, 
optimization and co-design to help researchers select the most efficient solutions for their experiments 
(see our [public Collective Knowledge repo](http://cKnowledge.org/repo) 
and [vision paper](https://arxiv.org/abs/1506.06256)). 
Join [our long-term community initiative](http://cKnowledge.org/ai) 
to crowdsource learning and AI/SW/HW co-design across billions of devices!

## Related Publications with long term CK vision

```
@inproceedings{cm:29db2248aba45e59:cd11e3a188574d80,
    url = {http://arxiv.org/abs/1506.06256},
    title = {{Collective Mind, Part II: Towards Performance- and Cost-Aware Software Engineering as a Natural Science.}},
    author = {Fursin, Grigori and Memon, Abdul and Guillon, Christophe and Lokhmotov, Anton},
    booktitle = {{18th International Workshop on Compilers for Parallel Computing (CPC'15)}},
    publisher = {ArXiv},
    year = {2015},
    month = January,
    pdf = {http://arxiv.org/pdf/1506.06256v1}
}

@inproceedings{ck-date16,
    title = {{Collective Knowledge}: towards {R\&D} sustainability},
    author = {Fursin, Grigori and Lokhmotov, Anton and Plowman, Ed},
    booktitle = {Proceedings of the Conference on Design, Automation and Test in Europe (DATE'16)},
    year = {2016},
    month = {March},
    url = {https://www.researchgate.net/publication/304010295_Collective_Knowledge_Towards_RD_Sustainability}
}

```

## Feedback

Get in touch with CK-AI developers [here](https://github.com/ctuning/ck/wiki/Contacts). 
Also feel free to engage with our community via this mailing list:
* http://groups.google.com/group/collective-knowledge
