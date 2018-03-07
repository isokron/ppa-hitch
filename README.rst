Hitch PPA
=========

These are packaging files to create a PPA of Hitch.

Scripts are based on Varnish Cache packaging.
debian/ build files are from Debian.

You need a GPG key and a launchpad account to upload.

Some notes
----------

To test binary packages in a local chroot:

* symlink "artful" (or $distrorelease) in debootstrap.
* `mk-sbuild --debootstrap-include=devscripts artful`
* Exchange aufs for overlay. `onion-type=overlay`
