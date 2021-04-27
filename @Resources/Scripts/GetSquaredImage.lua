
function Initialize()
  -- Get info from Skin
  measureOriginalWidth = SKIN:GetMeasure('MeasureOriginalWidth')
  measureOriginalHeight = SKIN:GetMeasure('MeasureOriginalHeight')
  sizeOfSquare = SELF:GetOption('SizeOfSquare')

end -- function Initialize

function Update()
  -- TODO Allow Height Customization
  newWidth = sizeOfSquare
  newHeight = 200

  originalWidth = measureOriginalWidth:GetValue()
  originalHeight = measureOriginalHeight:GetValue()


  -- Set height to 500, height gets calculated based on width
  resize = "0,"..sizeOfSquare..",5"
  -- Calculate the height and width after resizing
  widthAfterResize = originalWidth / originalHeight * sizeOfSquare
  heightAfterResize = originalHeight / originalWidth * sizeOfSquare

  -- Starting points for where to crop
  cropX = 0
  cropY = 0

  -- Calculate values based on ratio
  if originalWidth > originalHeight then
    cropX = math.floor((widthAfterResize - sizeOfSquare) / 2)
    crop = cropX..","..cropY..","..newWidth..","..newHeight..",1"

  elseif originalHeight > originalWidth then
    resize = sizeOfSquare..",0,5" -- Set width to 500 instead of height
    cropY = math.floor((heightAfterResize - sizeOfSquare) / 2)
    crop = cropX.."," ..cropY..","..newWidth..","..newHeight..",1"

  else
    cropY = (sizeOfSquare - newHeight) / 2
    crop = cropX..","..cropY..","..newWidth..","..newHeight..",1"

  end

  SKIN:Bang('!SetOption MeasureImage Image "File #ImagePath#| Resize '..resize..' | Crop '..crop..'"')
  SKIN:Bang('!UpdateMeasure MeasureImage')


end -- function Update
