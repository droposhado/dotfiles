#!/bin/bash
# Based on https://mths.be/macos

# Bypass the annoyingly slow t.co URL shortener
defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true
