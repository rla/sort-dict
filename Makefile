version:=$(shell swipl -q -s pack -g 'version(V),writeln(V)' -t halt)
packfile=sort_dict-$(version).tgz
remote=packs@packs.rlaanemets.com:/usr/share/nginx/packs.rlaanemets.com/sort-dict

package: test
	tar cvzf $(packfile) prolog tests pack.pl README.md LICENSE

test:
	swipl -s tests/tests.pl -g run_tests,halt -t 'halt(1)'

doc:
	swipl -q -t 'doc_save(prolog, [doc_root(doc),format(html),title(sort_dict),if(true),recursive(true)])'

upload: doc package
	scp $(packfile) $(remote)/$(packfile)
	rsync -avz -e ssh doc $(remote)

.PHONY: test package doc upload
