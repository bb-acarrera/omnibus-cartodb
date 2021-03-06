# see https://github.com/chef/omnibus/blob/master/lib/omnibus/project.rb for more detailed class doc
name "pgbouncer"
maintainer "CartoDB team"
homepage "https://github.com/CartoDB/omnibus-cartodb/blob/master/README.md"

build_version Omnibus::BuildVersion.semver

package_user   ENV['OMNIBUS_PACKAGE_USER']  || ENV['LOGNAME'] || 'root'
package_group  ENV['OMNIBUS_PACKAGE_GROUP'] || ENV['OMNIBUS_PACKAGE_USER'] || ENV['LOGNAME'] || 'root'
package_root = ENV['OMNIBUS_PACKAGE_ROOT']  || '/opt'

build_iteration ENV['OMNIBUS_PROJECT_BUILD_ITERATION'] || 1

install_dir "#{package_root}/#{name}"

# .rpm and .deb are already compressed so the below compress doesnt help much. 
# compress :tgz

exclude "**/.git"
exclude "**/bundler/git"

override :pgbouncer, version: "1.7.2"

dependency "preparation"
dependency 'repmgr'
dependency 'pgbouncer'
dependency "version-manifest"
