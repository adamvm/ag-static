**# ag-static**

*Project aimed to get statically built version of silversearch-ag*

**How to build**

*docker build -t silversearcher-ag .*

**How to test**

*docker run --rm silversearcher-ag:latest --version*

**How to get ag**

*docker run -d --name ag_container silversearcher-ag:latest*

*docker cp ag_container:/ag .*

*docker stop ag_container && docker rm ag_container*
