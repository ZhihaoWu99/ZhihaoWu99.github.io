 module Jekyll
  module HideCustomBibtex
    def hideCustomBibtex(input)
	  keywords = @context.registers[:site].config['filtered_bibtex_keywords']

	  keywords.each do |keyword|
		input = input.gsub(/^.*#{keyword}.*$\n/, '')
	  end
      	  input = input.gsub(/author\s*=\s*{([^}]*)}/) do |match|
           	author_field = $1
          	author_field = author_field.gsub(/[†\*]/, '')
          	"author = {#{author_field}}"
          end
      return input
    end
  end
end

Liquid::Template.register_filter(Jekyll::HideCustomBibtex)
