#!/bin/bash

# Export using:
#
#   $ defaults read com.mowglii.ItsycalApp
#
# From:
# https://github.com/sfsam/Itsycal/issues/84

# Custom format to show date
defaults write com.mowglii.ItsycalApp ClockFormat "E, MMM d H:mm"

defaults write com.mowglii.ItsycalApp HideIcon 1

defaults write com.mowglii.ItsycalApp HighlightedDOWs 65

# Fixed position in notification bar
defaults write com.mowglii.ItsycalApp "NSStatusItem Preferred Position ItsycalStatusItem" 213

defaults write com.mowglii.ItsycalApp SUEnableAutomaticChecks 1

defaults write com.mowglii.ItsycalApp SUHasLaunchedBefore 1

# Show next 7 days events
defaults write com.mowglii.ItsycalApp ShowEventDays 7

# Enables week number on first left column
defaults write com.mowglii.ItsycalApp ShowWeeks 1

defaults write com.mowglii.ItsycalApp SizePreference 1

# Week starts on monday
defaults write com.mowglii.ItsycalApp WeekStartDOW 1
