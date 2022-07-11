#!/bin/bash
#dotnet_funcs.sh


#
function download_dotnet_script() {
    #
    DOTNET_SCRIPT_URL=https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh

    #
    if [ ! -f $CACHE_DIR/dotnet-install.sh ]; then
        #
        output_section "Downloading .Net install script..."
        wget $DOTNET_SCRIPT_URL

        #copy script
        cp dotnet-install.sh $CACHE_DIR

        # give permission to install script
        chmod +x $CACHE_DIR/dotnet-install.sh

        #
        output_section "Installing .Net..."
        $CACHE_DIR/dotnet-install.sh --install-dir $CACHE_DIR/dotnet

        output_section ".Net installation finished."
    else
        output_section "Using cached .Net install."
    fi

    # add dotnet path to $PATH
    export PATH="$PATH:$CACHE_DIR/dotnet"
}
