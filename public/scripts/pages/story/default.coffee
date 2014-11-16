$ = require 'jquery'
Router = require 'router'
Flow = require 'flow'
require '../../components/csrf'

{upyun} = adou

$ ->
  router = new Router()

  # List
  router.on '/stories', ->
    console.log 'list'

  # Detail
  router.on '/stories/:id', ->
    console.log 'detail'

  router.configure html5history: true
  router.init()

  $('body').on 'click', 'a:not(.page)', (event) ->
    event.preventDefault()
    router.setRoute $(event.currentTarget).attr 'href'

#   flow = new Flow
#     target: upyun.api + '/starry-images'
#     singleFile: true
#     testChunks: false
#
#   flow.assignBrowse $('#replaceImage')[0]
#   flow.on 'filesSubmitted', ->
#     $.ajax
#       url: '/api/upyun_token'
#       type: 'POST'
#       data:
#         bucket: 'starry-images'
#         expiration: parseInt (new Date().getTime() + 600000)/1000, 10
#         'save-key': '/{year}{mon}/{day}/{filemd5}-{random}{.suffix}'
#       dataType: 'json'
#     .done (res) ->
#       flow.opts.query = res
#       flow.upload()
#     .fail (res) ->
#       error = res.responseJSON.error
#       window.alert error
#
#   flow.on 'fileSuccess', (file, message) ->
#     message = JSON.parse message
#     $('body').append "<img src='#{upyun.buckets['starry-images']}#{message.url}'>"