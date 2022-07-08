#!/bin/bash

#
function download_dotnet_script() {
    #
    DOTNET_SCRIPT_URL=https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh
    DOTNET_SCRIPT_FILE=dotnet-install.sh

    if [ ! -f $CACHE_DIR/DOTNET_SCRIPT_FILE ]; then
        #
        output_section "Downloading DotNet install script..."
        wget $DOTNET_SCRIPT_URL

        #cp DOTNET_SCRIPT_FILE $CACHE_DIR
        cp DOTNET_SCRIPT_FILE $BUILD_DIR

        # give file permission
        chmod +x $BUILD_DIR/.DOTNET_SCRIPT_FILE

        output_section "Installing DotNet..."
        #./dotnet-install $CACHE_DIR/dotnet
        ./dotnet-install --install-dir $BUILD_DIR/dotnet

        # add to path
        export PATH=$PATH:~/$BUILD_DIR/dotnet
    fi
}
