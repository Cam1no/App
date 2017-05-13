$ ->
  $('#user_base_image').on 'change',  ->
    file = $(this).prop('files')[0];
    reader = new FileReader()
    reader.onload = ->
      img_src = $('#upload-image-area').attr('src', reader.result)
      $('#upload-image-area').html(img_src)

    reader.readAsDataURL(file)
