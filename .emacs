(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(linum-format (quote dynamic))
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))
(put 'downcase-region 'disabled nil)

;; tweaks for cc mode
;; (setq c-default-style '((java-mode . "java")
;;                                   (awk-mode . "awk")
;;                                   (other . "linux"))

;; (defun my-make-CR-do-indent ()
;;             (define-key c-mode-base-map "\C-m" 'c-context-line-break))
;;           (add-hook 'c-initialization-hook 'my-make-CR-do-indent)


;;smart tabs in cc mode
;; (setq-default tab-width 8) ; or any other preferred value
;; (setq cua-auto-tabify-rectangles nil)

;; (defadvice align (around smart-tabs activate)
;;   (let ((indent-tabs-mode nil)) ad-do-it))

;; (defadvice align-regexp (around smart-tabs activate)
;;   (let ((indent-tabs-mode nil)) ad-do-it))

;; (defadvice indent-relative (around smart-tabs activate)
;;   (let ((indent-tabs-mode nil)) ad-do-it))

;; (defadvice indent-according-to-mode (around smart-tabs activate)
;;   (let ((indent-tabs-mode indent-tabs-mode))
;;     (if (memq indent-line-function
;; 	      '(indent-relative
;; 		indent-relative-maybe))
;; 	(setq indent-tabs-mode nil))
;;     ad-do-it))

;; (defmacro smart-tabs-advice (function offset)
;;   `(progn
;;      (defvaralias ',offset 'tab-width)
;;      (defadvice ,function (around smart-tabs activate)
;;        (cond
;; 	(indent-tabs-mode
;; 	 (save-excursion
;; 	   (beginning-of-line)
;; 	   (while (looking-at "\t*\\( +\\)\t+")
;; 	     (replace-match "" nil nil nil 1)))
;; 	 (setq tab-width tab-width)
;; 	 (let ((tab-width fill-column)
;; 	       (,offset fill-column)
;; 	       (wstart (window-start)))
;; 	   (unwind-protect
;; 	       (progn ad-do-it)
;; 	     (set-window-start (selected-window) wstart))))
;; 	(t
;; 	 ad-do-it)))))

;; (smart-tabs-advice c-indent-line c-basic-offset)
;; (smart-tabs-advice c-indent-region c-basic-offset)

(put 'upcase-region 'disabled nil)
