Apache FreeMarker Site

This is just the project with which we generate the freemarker.org home
page content. Note that most of the work is done by Apache FreeMarker
Docgen, which is a dependency of this project.

To publish the built site, comit the output into the "asf-site" branch.

Note that as of this writing, the "docgen" dependency is get from the Ivy
repo on the published homepage (http://freemarker.org/repos/ivy/). Those
modifying docgen should upload the fresh docgen jar there. Then you need to
run `ant update-deps` here to grab the latest version.
