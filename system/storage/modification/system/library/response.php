<?php
class Response {
	private $headers = array();
	private $level = 0;
	private $output;

	public function addHeader($header) {
		$this->headers[] = $header;
	}

	public function redirect($url, $status = 302) {

            if (class_exists('TB_Engine') && TB_Engine::hasInstance() && TB_Engine::instance()->getThemeData()->disable_redirect) {
                return;
            }
            
		header('Location: ' . str_replace(array('&amp;', "\n", "\r"), array('&', '', ''), $url), true, $status);
		exit();
	}

	public function setCompression($level) {
		$this->level = $level;
	}

	public function getOutput() {
		return $this->output;
	}
	
	public function setOutput($output) {
		$this->output = $output;
	}

	private function compress($data, $level = 0) {
		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false)) {
			$encoding = 'gzip';
		}

		if (isset($_SERVER['HTTP_ACCEPT_ENCODING']) && (strpos($_SERVER['HTTP_ACCEPT_ENCODING'], 'x-gzip') !== false)) {
			$encoding = 'x-gzip';
		}

		if (!isset($encoding) || ($level < -1 || $level > 9)) {
			return $data;
		}

		if (!extension_loaded('zlib') || ini_get('zlib.output_compression')) {
			return $data;
		}

		if (headers_sent()) {
			return $data;
		}

		if (connection_status()) {
			return $data;
		}

		$this->addHeader('Content-Encoding: ' . $encoding);

		return gzencode($data, (int)$level);
	}

	public function output() {

            if (class_exists('TB_Engine') && TB_Engine::hasInstance()) {
                $this->output = TB_Engine::instance()->getEventDispatcher()->filter(new sfEvent($this, 'ocResponse:output'), trim($this->output))->getReturnValue();
            }
            
		if ($this->output) {
			if ($this->level) {
				$output = $this->compress($this->output, $this->level);
			} else {
				$output = $this->output;
			}

			if (!headers_sent()) {
				foreach ($this->headers as $header) {
					header($header, true);
				}
			}


            if (class_exists('TB_Engine') && TB_Engine::OcRegistry()->get('save_url_map')) {
                $config = TB_Engine::ocConfig();
                $cache_key = 'url_map_' . $config->get('config_store_id') . '_' . $config->get('config_language_id');
                $url_map = TB_Engine::OcRegistry()->get('url_map');
                TB_Engine::OcRegistry()->get('tbEngine')->setCacheVar($cache_key, $url_map);
            }
            
			echo $output;
		}
	}
}