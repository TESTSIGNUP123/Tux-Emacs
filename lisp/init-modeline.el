
;;Helm
(require 'helm-config)
(global-set-key (kbd "C-x r b") #'helm-file-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1) 
(set-face-attribute 'default nil :font "monaco 14")      ;;Fonts

(provide 'init-modeline)

