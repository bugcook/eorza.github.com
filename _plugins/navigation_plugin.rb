module Jekyll

  class SiteNavigation < Generator
    safe true
    priority :lowest

    def generate(site)

      sorted = []

      site.pages.each do |page|
        if page.data['navigation'] && page.data['navigation']['show']
          sorted << page
        end
      end

      sorted = sorted.sort{ |a,b| a.data["navigation"]["weight"] <=> b.data["navigation"]["weight"] }

      site.config["navigation"] = sorted
    end
  end

end
