# "rooted" version of postgres (forked from version 17.4)

**DON'T USE THIS, IF YOU DON'T KNOW WHAT YOU'RE DOING!**

A fork of postgres source and corresponding docker setups with root-checks disabled, so that it can 
be used more conveniently and securely in rootless container setups, where the container user is
usually root, but mapped to the non-root host user.

Postgres has been hard-coded to not be run by the root user. While this generally makes perfect
sense security-wise, it becomes problematic in containerized environments, where within the
container, the main user is root, but which is actually mapped to the host non-root user via user
namespaces. This can be the case in rootless docker setups or with podman by default. In such
setups, sharing volumes between the host and the container leads to conflicts, because the shared
files have conflicting uids. Working around this issue is difficult and might require shared groups
between host and container, matching guids, or chmodding / chowning the host folder. All cumbersome.

## changes to upstream repo

This fork removed all root-checks within the code-base from the upstream repo. The changed code
parts can be inspected in this commit: 
https://github.com/SteffRhes/postgres_rooted/commit/52fea3f272a2f6fa3d50456d2a3a2aaa28bab8a4  

## changes to docker build

To build a docker image which is as close as possible to the official postgres one, the
corresponding Dockerfile and related scripts were fetched from:
https://github.com/docker-library/postgres/tree/cc254e85ed86e1f8c9052f9cbf0e3320324f0421/17/bookworm
and modified where there were user-specific instructions. Additionally, the official Dockerfile
would install or build apt packages from the official postgres mirror at:
http://apt.postgresql.org/pub/repos/apt/ . This major part of the Dockerfile was completely removed,
since the modified Dockerfile had to build from the modified source code of this repo. Thus, the apt
related install / build section was replaced entirely with building instructions as provided at the
official postgres website: https://www.postgresql.org/docs/17/install-make.html The changes between
the official docker files and the modified versions can be inspected here:
https://github.com/SteffRhes/postgres_rooted/commit/6299e4b67bd2be02936ea06d5b00bf7d55e712b6

PostgreSQL Database Management System
=====================================

This directory contains the source code distribution of the PostgreSQL
database management system.

PostgreSQL is an advanced object-relational database management system
that supports an extended subset of the SQL standard, including
transactions, foreign keys, subqueries, triggers, user-defined types
and functions.  This distribution also contains C language bindings.

Copyright and license information can be found in the file COPYRIGHT.

General documentation about this version of PostgreSQL can be found at
<https://www.postgresql.org/docs/17/>.  In particular, information
about building PostgreSQL from the source code can be found at
<https://www.postgresql.org/docs/17/installation.html>.

The latest version of this software, and related software, may be
obtained at <https://www.postgresql.org/download/>.  For more information
look at our web site located at <https://www.postgresql.org/>.
