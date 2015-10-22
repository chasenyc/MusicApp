module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
      <input type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML
  end

  def ugly_lyrics(lyrics)
    lyric_arr = lyrics.split("\n")
    lyric_arr.map! do |line|
      "♫ #{h(line)}"
    end
    new_lyrics = lyric_arr.join("\n")
    "<pre>#{new_lyrics}</pre>".html_safe
  end


end
