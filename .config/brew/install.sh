#! /bin/bash

#set -x
cat << -EOF
#######################################################################
# 当前脚本用于在运行OS X的电脑上安装应用程序
# 原理为：利用homebrew作为OS X的包管理器
#         brew install 安装命令行程序
#         brew install --cask 安装GUI程序
#         Happy coding ~ Happy life.
#
# Author: jsycdut <jsycdut@gmail.com>
# Github: https://github.com/jsycdut/macam
#
# 祝使用愉快，有问题的话可以去GitHub提issue
#
# 注意事项
#
# 1. OS X尽量保持较新版本，否则可能满足不了Homebrew的依赖要求
# 2. 中途若遇见安装非常慢的情况，可用Ctrl+C打断，直接进行下一项的安装
# 如果脚本没有按照既定逻辑执行，取消install.sh 顶部的 set -x 注释，追踪一下执行路径
#######################################################################
-EOF

# 全局变量
HOMEBREW_REPO=`brew --repo`
HOMEBREW_CORE_REPO="$HOMEBREW_REPO/Library/Taps/homebrew/homebrew-core"
HOMEBREW_CASK_REPO="$HOMEBREW_REPO/Library/Taps/homebrew/homebrew-cask"

ALIYUN_HOMEBREW_GIT_URL="https://mirrors.aliyun.com/homebrew/brew.git/"
ALIYUN_HOMEBREW_CORE_GIT_URL="https://mirrors.aliyun.com/homebrew/homebrew-core.git"
ALIYUN_HOMEBREW_CASK_GIT_URL="https://mirrors.aliyun.com/homebrew/homebrew-cask.git"

APP_LIST_FILE="app-list.txt"
APPS=($(cat $APP_LIST_FILE))

# 退出码
DEPENDECY_NOT_SATISFIED=92

# 检查命令是否存在
function check_command_exist
{
  local command_name=$1
  command -v $command_name > /dev/null 2>&1
  if [[ $? != 0 ]]; then
    if [[ "$command_name" == "brew" ]]; then
      echo " 请执行以下命令以安装Homebrew， 请确保网络畅通，如果有代理，最好是用上"
      echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    else
    echo "依赖缺失，请先安装" $command_name
    fi
    exit $DEPENDECY_NOT_SATISFIED
  fi
}

# 检查所需的依赖软件包是否存在
function check_dependencyies
{
  local dependency_list=(git curl awk brew)
  for dependency in ${dependency_list[@]}; do
    check_command_exist $dependency
  done
}

# 获取git仓库的远程地址，只取git remote -v的第一行，所有有可能判断不准
# 因为仓库可能有多个远程的源，此处有待改进
function get_git_repo_remote_url
{
  local git_dir="$1"
  cd $git_dir
  git_repo_remote_url=$(git remote -v | head -n 1 | awk '{print $2}')
  echo $git_repo_remote_url
}

# 为git仓库设置远程地址
function set_git_repo_remote_url
{
  local git_dir=$1
  local git_remote_url=$2
  cd $git_dir && git remote set-url origin $git_remote_url
}

# 在国内使用阿里云的镜像，在更改了镜像之后
# 如果某些软件包需要访问github进行软件包下载之类的，那么brew会报错的
# 由于brew会读取http_proxy https_proxy和ALL_PROXY这几个环境变量，
# 那么在使用之前，先在terminal里面export这几个环境变量连到对应的代理服务器即可
function try_change_mirror
{
  local current_homebrew_url=$(get_git_repo_remote_url $HOMEBREW_REPO)
  local current_homebrew_core_url=$(get_git_repo_remote_url $HOMEBREW_CORE_REPO)
  local current_homebrew_cask_url=$(get_git_repo_remote_url $HOMEBREW_CASK_REPO)

  if [[ "$current_homebrew_url" != "$ALIYUN_HOMEBREW_GIT_URL" ]]; then
    set_git_repo_remote_url $HOMEBREW_REPO $ALIYUN_HOMEBREW_GIT_URL
  fi

  if [[ "$current_homebrew_core_url" != "$ALIYUN_HOMEBREW_CORE_GIT_URL" ]]; then
    set_git_repo_remote_url $HOMEBREW_CORE_REPO $ALIYUN_HOMEBREW_CORE_GIT_URL
  fi

  if [[ "$current_homebrew_cask_url" != "$ALIYUN_HOMEBREW_CASK_GIT_URL" ]]; then
    set_git_repo_remote_url $HOMEBREW_CASK_REPO $ALIYUN_HOMEBREW_CASK_GIT_URL
  fi

  read -p "💫 是否执行brew update -v 更新软件源（Y|N): " ans
  case $ans in
    'Y' | 'y')
      brew update -v
      ;;
    *);;
  esac
}

# 检查候选软件包是否已经安装
# 接受两个参数，第一个参数为1或者其他值，1代表为图形化的cask App，否则为命令行App
# 第二个参数为候选软件包的名字
function check_candidate_already_installed
{
  local is_candidate_a_cask_app=$1
  local candidate_app_name=$2

  local brew_list_command_option='--formula'
  if [[ "$is_candidate_a_cask_app" == "gui" ]]; then
      brew_list_command_option='--cask'
  fi

  brew list $brew_list_command_option $candidate_app_name > /dev/null 2>&1

  if [[ $? -eq 0 ]]; then
     return 0
  fi

  return 1
}

# 使用brew安装软件包
function install_package
{
  local candidate_type=$1
  local candidate_name=$2

  check_candidate_already_installed $candidate_type $candidate_name
  if [[ $? -eq 0 ]]; then
    echo "👌 ==>已安装" $candidate_name "，跳过..."
  else
    echo "🔥 ==>正在安装 " $candidate_name
    brew install $candidate_name
    if [[ $? -eq 0 ]]; then
      echo "🍺 ==>安装成功 " $candidate_name
    else
      echo "🚫 ==>安装失败 " $candidate_name
    fi
  fi
}

# 程序入口
function main
{
  echo
  echo "🙏  请花5秒时间看一下上述注意事项"
  sleep 5s

  check_dependencyies
  try_change_mirror
  local number_of_apps=$(wc -l $APP_LIST_FILE | awk -F ' ' '{print $1}')
  local candidates=()
  while : ; do
    echo "-------------------------------------------------------------------------"
    printf "%-8s %-8s %-22s %-20s\n" "序号" "类型" "名称" "描述"
    echo "-------------------------------------------------------------------------"
    for ((index=0; index<$number_of_apps; index++)); do
      local idx_pivot=$(expr $index \* 3)
      local idx_of_app_type=$(expr $idx_pivot + 0)
      local idx_of_app_name=$(expr $idx_pivot + 1)
      local idx_of_app_description=$(expr $idx_pivot + 2)
      printf "%-6s %-6s %-20s %-20s\n" "$(expr $index + 1)." ${APPS[$idx_of_app_type]} ${APPS[$idx_of_app_name]} ${APPS[$idx_of_app_description]}
    done

    while IFS= read -r -p "✍️  请输入您想要安装的软件包的编号（多个软件包请用空格分隔，直接回车则全部安装）: " candidate; do
      [[ -n "$candidate" ]] || break
      candidates+=$candidate && break
    done

    if [[ "${#candidates[@]}" -eq 0 ]]; then
      echo "🌹 即将安装列表中的所有软件包，有的安装可能耗时较长，可以使用C-c中断正在进行的软件包安装进程"
      sleep 3s
      candidates+=$(seq 1 $number_of_apps)
    fi

    for candidate in ${candidates[@]}; do
      local pivot_index_of_candidate=$(expr 3 \*  $(expr $candidate - 1))
      local type_of_candidate=${APPS[$(expr $pivot_index_of_candidate + 0)]}
      local name_of_candidate=${APPS[$(expr $pivot_index_of_candidate + 1)]}
      install_package $type_of_candidate $name_of_candidate
    done

    read  -p "📕 是否继续查看菜单列表，Y/y继续，N/n退出 ：" ans
    case $ans in
      Y|y) : # : 命令代表啥也不做，返回值为0
        ;;
      *) break
        ;;
    esac
  done
}

main
