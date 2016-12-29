require 'fileutils'

images = Dir.glob("*.jpg")
images.each do |image|
  filename = File.basename(image)
  unless File.exists?("full/#{filename}")
    image_width = `convert #{image} -ping -format \"%w\" info:`
    image_height = `convert #{image} -ping -format \"%h\" info:`

    if (image_height > image_width)
      maximum_watermark_width = Integer(Integer(image_width) * 0.4) # 20% of image width
    else
      maximum_watermark_width = Integer(Integer(image_width) * 0.2) # 20% of image width
    end

    puts filename
    system("composite -dissolve 100% -gravity southwest \\\( deploy/watermark-white.png -resize #{maximum_watermark_width} \\\) #{image} full/#{filename}")
  end
end

puts "watermarked images: #{images.length}"

gifs = Dir.glob("*.gif")
gifs.each do |image|
  filename = File.basename(image)
  unless File.exists?("full/#{filename}")
    FileUtils.cp(filename, "full/")
  end
end
