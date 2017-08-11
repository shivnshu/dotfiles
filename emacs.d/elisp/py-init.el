;;; py-init.el --- Emacs python development environment
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(provide 'py-init)
;;; py-init.el ends here
