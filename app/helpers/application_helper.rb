module ApplicationHelper

# def button(name,url)
  def button(*args)
    if args.size == 2
      name = args[0]
      url = args[1]
      content_tag :button, :type => "button", :onclick => "window.location.href =  '#{url_for(url)}'; " do
        "#{name}"
      end
    elsif args.size == 1
      name = args[0]
      content_tag :button, :type => "button" do
        "#{name}"
      end
    end
  end

  def pdf_image_tag(image, options = {})
    options[:src] = File.expand_path(Rails.root) + '' + image
    tag(:img, options)
  end

  def vehicle_status_as_array_with_index
    [*VEHICLE_STATUS.collect {|v,i| [t(v),VEHICLE_STATUS.index(v)] }]
  end
end
