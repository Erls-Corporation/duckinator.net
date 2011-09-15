function github(username, identifier) {
	var items = [];

	$.getJSON('https://api.github.com/users/' + username + '/repos?callback=?', function(data){
		$.each(data.data, function(repo){
			$('<li data-pushed-at="' + repo.pushed_at + '"><p><a href="' + repo.html_url + '">' + repo.name + '</a> (' + repo.forks + ' forks, ' + repo.watchers + ' watchers)</p>' +
				'<p>' + repo.description + '</p></li>').appendTo(identifier);
		});
	});

	$(identifier + ' li').sortElements(function(a, b){
		return $(a).text() > $(b).text() ? 1 : -1;
	});
}