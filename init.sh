# add submodule sphinx-doc/sphinx
# checkout submodule branch:1.7 OR tag:1.7.x

# add current path to $path
CURRENT_PATH=$(pwd)
export PATH=$CURRENT_PATH:$PATH
source activate sphinx-cmd

# init a blank .tx/config file
#tx init --skipsetup

rm -rf pot

# init pot files from source rst files
sphinx-build -T -b gettext sphinx/doc pot

# set env var for sphinx-intl command
export SPHINXINTL_TRANSIFEX_PROJECT_NAME=sphinx-doc-1_7
export SPHINXINTL_TRANSIFEX_USERNAME=cdarlint

# link local resources to remote transifex resources
sphinx-intl update-txconfig-resources -p pot -d .

# example for pull a remote transifex resource
# tx pull -r sphinx-doc-1_7.sphinx --lang zh_CN

