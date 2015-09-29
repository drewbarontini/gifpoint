# *************************************
#
#   Application
#   -> Manifest
#
# *************************************

# -------------------------------------
#   Namespace
# -------------------------------------
#= require presenter

# -------------------------------------
#   Routes
# -------------------------------------
#= require routes

# -------------------------------------
#   Services
# -------------------------------------
#= require services/progress
#= require services/hotkeys

# -------------------------------------
#   Directives
# -------------------------------------
#= require directives/progress
#= require directives/slideLoader
#= require directives/slides
#= require directives/slide
#= require directives/ytVideo

# -------------------------------------
#   Document Ready
# -------------------------------------

jQuery ($) ->
  if window.location.hash is ''
    window.location = '/#/'
