check: check-schemas check-examples

check-schemas:
	@check-jsonschema --verbose --check-metaschema routes.schema.yaml

check-examples:
	check-jsonschema --verbose --schemafile routes.schema.yaml routes.example.json

routes.schema.json: routes.schema.yaml
	yq -o json . < $< > $@

clean:
	rm -f routes.schema.json
