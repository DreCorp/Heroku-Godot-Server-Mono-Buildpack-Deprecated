#!/bin/bash

#
function download_dotnet_script() {
    #
    DOTNET_SCRIPT_URL=https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh

    #
    if [ ! -f $CACHE_DIR/dotnet-install.sh ]; then
        #
        output_section "Downloading DotNet install script..."
        wget $DOTNET_SCRIPT_URL

        #copy script
        cp dotnet-install.sh $CACHE_DIR

        # give permission
        chmod +x $CACHE_DIR/dotnet-install.sh

        #
        output_section "Installing DotNet..."
        $CACHE_DIR/dotnet-install.sh --install-dir $CACHE_DIR/dotnet

        output_section "DotNet installation finished."
    else
        output_section "Using cached DotNet files."
    fi
    # copy dotnet folder
    cp -r $CACHE_DIR/dotnet $BUILD_DIR
    # add dotnet path to $PATH
    export PATH=$PATH:/$BUILD_DIR/dotnet

    :'
    if [ ! -f $BUILD_DIR/dotnet-install.sh ]; then
        #
        output_section "Downloading DotNet install script..."
        wget $DOTNET_SCRIPT_URL

        #copy script
        cp dotnet-install.sh $BUILD_DIR

        # give permission
        chmod +x $BUILD_DIR/dotnet-install.sh

        #
        output_section "Installing DotNet..."
        $BUILD_DIR/dotnet-install.sh --install-dir $BUILD_DIR/dotnet

        # add to path
        export PATH=$PATH:/$BUILD_DIR/dotnet
        output_section "DotNet installation finished."
    else
        output_section "Using cached DotNet executable.."
    fi
    # add to path
    export PATH=$PATH:/$BUILD_DIR/dotnet
    '
}
