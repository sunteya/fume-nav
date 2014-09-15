# Fume::Nav

help build navigation for rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fume-nav'
```


## Usage

### example

view.erb

~~~~ erb
<% @current = :edit %>
<%= fume_nav @current do |n| %>
<ul>
	<%= n.li_tag :show do %>
		<%= link_to 'show', link_path(@link) %>
	<% end %>
	<%= n.li_tag :edit do %>
		<%= link_to 'edit', edit_link_path(@link) %>
	<% end %>
</ul>
<% end %>
~~~~

output:

~~~~ html
<ul>
	<li>
		<a href="/links/1">show</a>
	</li>
	<li class="active">
		<a href="/links/1/edit">edit</a>
	</li>
</ul>
~~~~

### Options

~~~ erb
<%= fume_nav(current_value, options) do |n| %>
	// OOXX
<% end %>
~~~

OPTIONS:
<table>
	<tr>
		<td>active_class</td><td>the current active item class, default: 'active'</td>
	</tr>
	<tr>
		<td>hide_if_empty</td><td>don't output content html if not exist any subitem, default: true</td>
	</tr>
</table>


## Contributing

1. Fork it ( https://github.com/sunteya/fume-nav/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
