module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the sign up page/i
      sign_up_path
    when /the sign in page/i
      sign_in_path
    when /the password reset request page/i
      new_password_path

    # Add more page name => path mappings here
    when /the new plugin page/i
      new_plugin_path

    when /the plugins page/i
      plugins_path

    when /the new release page/i
      new_plugin_release_path @plugin


    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
