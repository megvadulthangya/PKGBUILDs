var fs = require('fs');
var path = require('path');
var cp = require('child_process');
if(process.argv.length > 3) {
	var from = process.argv[2], to = process.argv[3];
	if(fs.existsSync(from) && fs.lstatSync(from).isDirectory()) {
		if(fs.existsSync(to) && fs.lstatSync(to).isDirectory()) {
			console.log('Looking for custom partner content in ' + from);
			console.log('Looking for default partner content in ' + to);
			var images = path.join(from,'resources');
			if(fs.existsSync(images) && fs.lstatSync(images).isDirectory()) {
				var resources = path.join(to,'resources');
				if(fs.existsSync(resources) && fs.lstatSync(resources).isDirectory()) {
					console.log('Copying ' + images + ' to ' + resources);
					try {
						cp.execSync('cp -r "' + images + '" "' + to + '"');
					}
					catch(err) {
						console.log('Error occurred while trying to copy ' + images + ' to ' + to + ':\n' + err);
					}
				}
				else {
					console.log('Can not locate directory ' + resources);
				}
			}
			else {
				console.log('Can not locate directory ' + images);
			}
			var bookmarks = path.join(from,'default-bookmarks');
			if(fs.existsSync(bookmarks) && fs.lstatSync(bookmarks).isDirectory()) {
				var vbookmarks = path.join(to,'default-bookmarks');
				if(fs.existsSync(vbookmarks) && fs.lstatSync(vbookmarks).isDirectory()) {
					console.log('Reading ' + bookmarks + ' directory list');
					var langs = fs.readdirSync(bookmarks);
					console.log('Reading ' + vbookmarks + ' directory list');
					var locales = fs.readdirSync(vbookmarks);
					for(locale of locales) {
						if(locale.search(/^[a-z]{2}(?:-[A-Z]{2})?\.json$/) != -1) {
							var entries = path.join(from,'default-bookmarks',locale);
							if(fs.existsSync(entries)) {
								var ventries = path.join(to,'default-bookmarks',locale);
								if(fs.existsSync(ventries)) {
									console.log('Reading ' + ventries + ' list');
									var vpartners = JSON.parse(fs.readFileSync(ventries));
									console.log('Reading ' + entries + ' list');
									var partners = JSON.parse(fs.readFileSync(entries));
									for(var vpartner in vpartners.children) {
										for(var partner in partners.children) {
											if(vpartners.children[vpartner].name == partners.children[partner].name && vpartners.children[vpartner].children && partners.children[partner].children) {
												console.log('Updated ' + partners.children[partner].name + ' in ' + ventries);
												vpartners.children[vpartner].children = vpartners.children[vpartner].children.concat(partners.children[partner].children);
											}
										}
									}
									fs.writeFileSync(ventries,JSON.stringify(vpartners,null,2));
								}
								else {
									console.log('Can not locate ' + partners);
								}
							}
							else {
								console.log('Can not locate ' + entries);
							}
						}
					}
					var entries = path.join(from,'default-bookmarks/partners-locale-map.json');
					if(fs.existsSync(entries)) {
						var partners = path.join(to,'default-bookmarks/partners-locale-map.json');
						if(fs.existsSync(partners)) {
							console.log('Reading ' + partners + ' list');
							var vpartners = JSON.parse(fs.readFileSync(partners));
							console.log('Reading ' + entries + ' list');
							var npartners = JSON.parse(fs.readFileSync(entries));
							for(var partner of Object.keys(vpartners)) {
								if(npartners[partner]) {
									console.log('Updated ' + partner + ' in ' + partners);
									vpartners[partner] = vpartners[partner].concat(npartners[partner]);
								}
							}
							fs.writeFileSync(partners,JSON.stringify(vpartners,null,2));
						}
						else {
							console.log('Can not locate ' + partners);
						}
					}
					else {
						console.log('Can not locate ' + entries);
					}
				}
				else {
					console.log('Can not locate directory ' + bookmarks);
				}
			}
			else {
				console.log('Can not locate directory ' + vbookmarks);
			}
		}
		else {
			console.log('Can not locate directory ' + to);
		}
	}
	else {
		console.log('Can not locate directory ' + from);
	}
}
else {
	console.log('Please provide path to custom partner content and default partner content');
}
