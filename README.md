# Fume::Nav

[![Build Status](https://travis-ci.org/sunteya/fume-nav.svg?branch=master)](https://travis-ci.org/sunteya/fume-nav)

help build navigation for rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fume-nav'
```


## Usage

### example

view.erb

```rb
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

<%= fume_nav @current do |n| %>
  <div class="dropdown">
    <%= n.link_to :show, "link_1", root_path, class: "link" %>
    <%= n.apply :edit do |cls| %>
      <%= link_to "link_2", root_path, class: "link #{cls}" %>
    <% end %>
  </div>
<% end %>
```

output:

```html
<ul>
  <li>
    <a href="/links/1">show</a>
  </li>
  <li class="active">
    <a href="/links/1/edit">edit</a>
  </li>
</ul>

<div class="dropdown">
  <a class="link active" href="/">link_1</a>
  <a class="link " href="/">link_2</a>
</div>
```

### Options

```erb
<%= fume_nav(current_value, options) do |n| %>
  // OOXX
<% end %>
```

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
