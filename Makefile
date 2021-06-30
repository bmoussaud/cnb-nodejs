
APP_IMAGE=myorg/cnb-nodejs
BUILDPACK_IMAGE=mycompany/owner-buildpack
BUILDPACK_CNB=owner-buildpack.cnb

# pack config default-builder gcr.io/paketo-buildpacks/builder:base
buildpack:
	pack build $(APP_IMAGE) --builder paketobuildpacks/builder:base --buildpack ./mycompany-owner-buildpack
	
inspect: buildpack
	pack inspect $(APP_IMAGE) 
	pack inspect $(APP_IMAGE) --bom

package-image:
	pack buildpack package $(BUILDPACK_IMAGE) --config packages/package.toml

package-cnb:
	pack buildpack package $(BUILDPACK_CNB) --config packages/package.toml --format file

clean:
	rm $(BUILDPACK_CNB)