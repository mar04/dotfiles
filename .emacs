(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (adwaita)))
 '(fill-column 78)
 '(inhibit-default-init t)
 '(inhibit-startup-echo-area-message "mariusz")
 '(inhibit-startup-screen t)
 '(mouse-avoidance-mode (quote banish) nil (avoid))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))
(put 'downcase-region 'disabled nil)

;; MY SETTINGS ---------------------------------------------------------------

;; REPOSITORIES --------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
 '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)



;; KEYS ----------------------------------------------------------------------
(global-set-key (kbd "C-h") 'delete-backward-char)

;;(global-linum-mode t)
;;backup-dir.el or something like that
;;TODO: cursor shape to bar/beam

(require 'fill-column-indicator)
;;(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode 1)
;; swap count-words-region and count-words keys
