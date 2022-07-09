#!/bin/bash

#
function download_dotnet_script() {
    #
    DOTNET_SCRIPT_URL=https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh

    if [ ! -f $BUILD_DIR/dotnet-install.sh ]; then
        #
        output_section "Downloading DotNet install script..."
        wget $DOTNET_SCRIPT_URL

        #cp DOTNET_SCRIPT_FILE $CACHE_DIR
        cp dotnet-install.sh $BUILD_DIR

        # give file permission
        chmod +x $BUILD_DIR/dotnet-install.sh

        #
        output_section "Installing DotNet..."        
        $BUILD_DIR/dotnet-install.sh --install-dir $BUILD_DIR/dotnet

        # add to path
        export PATH=$PATH:/$BUILD_DIR/dotnet
    fi
}
