;;common-Lisp
;(add-to-list 'load-path "~/.emacs.d/elpa/slime-20190319.930")
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(slime-setup)
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-banner))
;;LSP-mode
(require 'lsp-mode)
(require 'lsp-java)
(require 'lsp-haskell)



;Go-mode
(add-to-list 'load-path "/home/w/.emacs.d/elpa/go-mode-20181012.329/")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook
      (lambda ()
        (set (make-local-variable 'company-backends) '(company-go))
        (company-mode)))




;;--------------------------Company补全&美化
    
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:background "gold3" :foreground "black"))))
 '(company-preview-common ((t (:background "gold3" :foreground "grey20"))))
 '(company-preview-search ((t (:background "green4" :foreground "green"))))
 '(company-scrollbar-bg ((t (:background "#303030"))))
 '(company-scrollbar-fg ((t (:background "#404040"))))
 '(company-tooltip ((t (:background "#202020" :foreground "grey"))))
 '(company-tooltip-annotation ((t (:foreground "gold"))))
 '(company-tooltip-annotation-selection ((t (:foreground "white"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :foreground "white"))))
 '(company-tooltip-common-selection ((t (:foreground "white"))))
 '(company-tooltip-selection ((t (:background "red3" :foreground "white")))))
(add-to-list 'load-path "～/.emacs.d/company-mode")
(autoload 'company-mode "company" nil t)
(setq company-idle-delay 0.2;菜单延迟
      company-minimum-prefix-length 1; 开始补全字数0
      company-require-match nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
      company-show-numbers t; 显示序号
      company-transformers '(company-sort-by-backend-importance)
      company-continue-commands '(not helm-dabbrev)
      )



;;company|LSP补全
(global-company-mode t)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'org-mode-hook 'company-mode)
(add-hook 'elisp-mode-hook 'company-mode)
(add-hook 'css-mode-hook 'company-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'company-mode)
 ;LSP
(add-hook 'lsp-mode-hook 'lsp-lens-mode)
(add-hook 'java-mode-hook 'lsp-java-boot-lens-mode)
(add-hook 'go-mode-hook  'lsp-mode)
(add-hook 'org-mode-hook   'lsp-mode)
(add-hook 'elisp-mode-hook  'lsp-mode)
(add-hook 'css-mode-hook   'lsp-mode)
(add-hook 'python-mode-hook  'anaconda-mode)
(add-hook 'c-mode-hook  'lsp-mode)
(add-hook 'c++-mode-hook  'lsp-mode)
(add-hook 'java-mode-hook 'lsp-mode)
(add-hook 'haskell-mode-hook 'lsp-mode)

;;----------------------autopair括号
(require 'autopair)
(autopair-global-mode) ;; 自动补全括号
(show-paren-mode t) ;; 匹配括号高亮

;;------------------Python补全
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;;------------------yas模板
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;TabNine
(require 'company-tabnine)
(add-to-list 'company-backends #'company-tabnine)
(setq company-idle-delay 0)
(setq company-show-numbers t)
; company-transformers
(setq company-tabnine--disable-next-transform nil)
(defun my-company--transform-candidates (func &rest args)
  (if (not company-tabnine--disable-next-transform)
      (apply func args)
    (setq company-tabnine--disable-next-transform nil)
    (car args)))

(defun my-company-tabnine (func &rest args)
  (when (eq (car args) 'candidates)
    (setq company-tabnine--disable-next-transform t))
  (apply func args))

(advice-add #'company--transform-candidates :around #'my-company--transform-candidates)
(advice-add #'company-tabnine :around #'my-company-tabnine)

(provide 'init-code)
