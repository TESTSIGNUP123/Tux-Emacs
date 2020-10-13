
;(set-default-font "monaco-12")
(setq inhibit-compacting-font-caches t)
(require 'all-the-icons)
(insert (all-the-icons-icon-for-file "foo.js"))
(all-the-icons-octicon "file-binary")  ;; GitHub Octicon for Binary File
(all-the-icons-faicon  "cogs")         ;; FontAwesome icon for cogs
(all-the-icons-wicon   "tornado")      ;; Weather Icon for tornado
(all-the-icons-wicon "tornado" :face 'all-the-icons-blue)
(set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append)
(set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'append)
;;--------------------------Themes
(load-theme 'night-owl t)
;(load-theme 'dracula t)
;(load-theme 'leuven)
;(load-theme ' gruvbox-dark-medium  t) ;;夜间
;(load-theme ' gruvbox-dark-hard t)
;(load-theme 'gruvbox-light-soft t)
;;-----------------------Gui
(setq-default tab-width 4)
(setq display-time-use-mail t)
(setq frame-title-format '("Emacs" buffer-file-name))
(setq-default c-basic-offset 4)
(setq initial-scratch-message  "World")
(tool-bar-mode -1) ;;关闭工具栏
;(set-scroll-bar-mode -1)


;;设置窗口位置为屏库左上角(0,0)
;;(set-frame-position (selected-frame) 0 0)
;;设置宽和高,我的十寸小本是110,33,大家可以调整这个参数来适应自己屏幕大小
;(set-frame-width (selected-frame) 120)
;(set-frame-height (selected-frame) 30)
(set-frame-parameter nil 'alpha 90) ;透明
(set-language-environment "UTF-8") ;;UTF-8
(menu-bar-mode -1)
(setq make-backup-files nil) ;;关闭备份
(scroll-bar-mode 0) ;;关闭文件滑动控件
;(global-linum-mode 1) ;;显示行号
(setq ring-bell-function 'ignore) ;;关闭哔哔的警告提示音
(fset 'yes-or-no-p 'y-or-n-p) ;; （Y or N）
(setq inhibit-splash-screen 1) ;; 关闭启动帮助画面
(defun open-init-file()
  (interactive)
  (find-file "/home/w/.emacs.d/init.el")) ;; 快速打开配置文件
(global-set-key (kbd "<f2>") 'open-init-file) ;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
;;行号
 (require 'hlinum)
    (hlinum-activate)


;;doom-modeline 
(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-buffer-file-name-style 'file-name)
(setq doom-modeline-height 20)
(setq doom-modeline-project-detection 'project)
(setq doom-modeline-buffer-state-icon nil)
(setq doom-modeline-minor-modes t)
(setq doom-modeline-enable-word-count nil)
(setq doom-modeline-vcs-max-length 24)


;;Neotree-Config-user
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


(provide 'init-ui)
