
<?php
class Request {
        private $method;
        private $protocol;
        private $ip;
	private $remote_ip;
        private $resource;
        private $parameters;
	public function __construct($method, $protocol, $ip, $remote_ip, $resource, $parameters) {
		$this->method = $method;
		$this->protocol = $protocol;
		$this->ip = $ip;
		$this->remote_ip = $remote_ip;
		$this->resource = $resource;
		$this->parameters = $parameters;
	}
	public function toString() {
		$parameters = "";
		foreach($this->parameters as $key => $value){
		$parameters = $parameters . $key . "=" . $value . "&";
}
	
		return $this->protocol . "://" . $this->ip . "/" . $this->resource .  "?" . substr($parameters, 0, -1);
	}
        //get e set method
        public function SetMethod($method) {
                $this->method = $method;
        }
        public function GetMethod() {
                return $this->method;
        }
        //get e set protocol
        public function SetProtocol($protocol) {
                $this->protocol = $protocol;
        }
        public function GetProtocol() {
                return $this->protocol;
        }
        //get e set ip
        public function SetId($id) {
                $this->id = $id;
        }
        public function GetId() {
                return $this->id;
        }
	//get e set remote_ip
	public function SetRemoteIp($remote_ip) {
		$this->remote_ip = $remote_ip;
	}
	public function GetRemoteIp() {
		return $this->remote_ip;
	}
        //get e set resource
        public function SetResource($resource) {
                $this->resource = $resource;
        }
        public function GetResource() {
                return $this->resource;
        }
        //get e set parameters
        public function SetParameters($parameters) {
                $this->parameters = $parameters;
        }
        public function GetParameters() {
                return $this->parameters;
        }
}
