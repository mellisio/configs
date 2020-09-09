(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rspec-mode ag company go-mode column-marker json-mode js2-mode web-mode flycheck yaml-mode smart-jump rvm robe))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'flymake-ruby)
(require 'rspec-mode)
(global-set-key (kbd "C-M-g") 'dumb-jump-go)
(setq rspec-use-rvm t)
(setq ruby-version-manager 'rvm)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq-default indent-tabs-mode nil)
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
(setq js2-strict-missing-semi-warning nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jb\\'" . ruby-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 0)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(require 'whitespace)
(setq whitespace-line-column 120) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'ruby-mode-hook 'whitespace-mode)
(global-auto-revert-mode t)
(set-face-attribute 'default nil :height 220)
(load-theme 'nimbus t)
(global-set-key [?\C-x ?\C-f] 'ag-project-dired)
(put 'upcase-region 'disabled t)
