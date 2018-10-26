#!/bin/bash

# Set Show Next Tab and Show Previous Tab shorts to Cmd-Opt-RightArrow and Cmd-Opt-LeftArrow
defaults write com.apple.Terminal NSUserKeyEquivalents \
         '{"Show Next Tab" = "@~\U2192"; "Show Previous Tab" = "@~\U2190"; }'
